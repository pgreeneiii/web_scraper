Rails.application.routes.draw do
  get("/", { :controller => "aapl_questions", :action => "home" })

  get("/aapl/one", { :controller => "aapl_questions", :action => "one" })

  get("/aapl/two", { :controller => "aapl_questions", :action => "two" })

  get("/aapl/three", { :controller => "aapl_questions", :action => "three" })

  get("/aapl/four", { :controller => "aapl_questions", :action => "four" })

  get("/aapl/five", { :controller => "aapl_questions", :action => "five" })
end
