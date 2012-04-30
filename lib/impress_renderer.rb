require 'redcarpet'
class ImpressRenderer < Redcarpet::Render::HTML
  @@attrs = []
  @@current = 0
  @@head = ""

  def self.init_with_attrs att
    @@attrs = att
    @@current = 0
  end

  def self.set_head head
    @@head = head
  end

  def hrule
    # this is how we later inject attributes into pages. what an awful hack.
    @@current += 1
    %{</div>
      <div class='step' #{@@attrs[@@current]}>
    }
  end

  def block_code code, lang
    "<pre><code class='prettyprint #{lang}'>#{code}</code></pre>"
  end

  def codespan code
    "<code class='inline prettyprint'>#{code}</code>"
  end

  def doc_header
    %{
<html>
  <head>
    <link href="css/reset.css" rel="stylesheet" />
    <!-- Code Prettifier: -->
<link href="css/prettify.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/prettify.js"></script>
    <link href="css/style.css" rel="stylesheet" />
#{@@head}
  </head>

  <body onload="prettyPrint()">
    <div id="impress">
    <div class='step' #{@@attrs[0]}>
    }
  end

  def doc_footer
    %{
      </div>
    <script src="js/impress.js"></script>
    <script>impress();</script>
  </body>
</html>
    }
  end
end

