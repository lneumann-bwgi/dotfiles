return {
  "neumann-mlucas/snacks-lexicon.nvim",
  lazy = true,
  keys = {
    {
      "<leader>ww",
      function()
        require("lexicon.picker").open()
      end,
      desc = "Lexicon (English)",
    },
  },
  opts = {
    provider = "cli",
    timeout_ms = 2000,
    default_lang = "en",
    languages = {
      en = { sources = { "wn", "moby-thesaurus", "gcide", "foldoc", "jargon", "vera", "devil", "elements" } },
      pt = { sources = { "por-eng", "eng-por" } },
      de = { sources = { "deu-eng", "eng-deu" } },
      es = { sources = { "spa-eng", "eng-spa" } },
      fr = { sources = { "fra-eng", "eng-fra" } },
    },
  },
  config = function(_, opts)
    require("lexicon").setup(opts)
  end,
}
