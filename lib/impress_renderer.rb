require 'redcarpet'
class ImpressRenderer < Redcarpet::Render::HTML
  @@attrs = []
  @@current = 0
  @@author, @@head, @@title = nil

  def self.init_with_attrs _attrs, _opts
    @@attrs = _attrs
    @@current = 0
    @@opts = _opts
  end

  def self.author= author
    @@author = "<meta name=\"author\" content=\"#{author}\">"
  end

  def self.head= head
    @@head = head
  end

  def self.title= title
    @@title = "<title>#{title}</title>"
  end

  def hrule
    # this is how we later inject attributes into pages. what an awful hack.
    @@current += 1
    %{</div>
      <div class='step' #{@@attrs[@@current]}>
    }
  end

  def block_code code, lang
    code.gsub!("<", "&lt;")
    code.gsub!(">", "&gt;")
    "<pre><code class='prettyprint #{lang}'>#{code}</code></pre>"
  end

  def codespan code
    "<code class='inline prettyprint'>#{code}</code>"
  end

  def mathjax
    if @@opts[:latex]
      %{
        <script type="text/x-mathjax-config">
          MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
        </script>
        <script type="text/javascript"
          src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
        </script>
      }
    end
  end

  def doc_header
    %{<!DOCTYPE html>
<html>
  <head>
    #{@@title}
    <link href="css/reset.css" rel="stylesheet" />
    #{@@author}
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link rel="shortcut icon" href="css/favicon.png" />
    <link rel="apple-touch-icon" href="css/apple-touch-icon.png" />
    <!-- Code Prettifier: -->
<link href="css/highlight.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
#{self.mathjax}
    <link href="css/style.css" rel="stylesheet" />
#{@@head}
  </head>

  <body>
  <div class="fallback-message">
  <p>Your browser <b>doesn't support the features required</b> by impress.js, so you are presented with a simplified version of this presentation.</p>
  <p>For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser.</p>
  </div>
    <div id="impress">
    <div class='step' #{@@attrs[0]}>
    }
  end

  def doc_footer
    %{
      </div>
    <script src="js/impress.js"></script>
    <script>impress().init();</script>
  </body>
</html>
    }
  end
end

