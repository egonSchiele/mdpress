require 'redcarpet'
class ImpressRenderer < Redcarpet::Render::HTML
  def hrule
    %{</div>
      <div class="step">
    }
  end

  def block_code code, lang
    "<pre><code class='prettyprint'>#{code}</code></pre>"
  end

  def codespan code
    "<code class='inline prettyprint'>#{code}</code>"
  end

  def doc_header
    %{
<html>
  <head>
    <link href="css/reset.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400' rel='stylesheet' type='text/css'>    
    <!-- Code Prettifier: -->
<link href="css/prettify.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/prettify.js"></script>    
  </head>

  <body onload="prettyPrint()">
    <div id="impress">
    <div class="step">
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

