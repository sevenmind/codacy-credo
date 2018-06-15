Every module should contain comprehensive documentation.

    # preferred

    defmodule MyApp.Web.Search do
      @moduledoc """
      This module provides a public API for all search queries originating
      in the web layer.
      """
    end

    # also okay: explicitly say there is no documentation

    defmodule MyApp.Web.Search do
      @moduledoc false
    end

Many times a sentence or two in plain english, explaining why the module
exists, will suffice. Documenting your train of thought this way will help
both your co-workers and your future-self.

Other times you will want to elaborate even further and show some
examples of how the module's functions can and should be used.

In some cases however, you might not want to document things about a module,
e.g. it is part of a private API inside your project. Since Elixir prefers
explicitness over implicit behaviour, you should "tag" these modules with

    @moduledoc false

to make it clear that there is no intention in documenting it.
