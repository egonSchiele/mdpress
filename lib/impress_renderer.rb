require 'redcarpet'
class ImpressRenderer < Redcarpet::Render::HTML
  def hrule
    %{</div>
      <div class="step">
    }
  end

  def doc_header
    %{
<html>
  <head>
    <link href="style.css" rel="stylesheet" />
  </head>

  <body>
    <div id="impress">
    <div class="step">
    }
  end

  def doc_footer
    %{
      </div>
    <script src="impress.js"></script>
    <script>impress();</script>
  </body>
</html>
    }
  end
end

