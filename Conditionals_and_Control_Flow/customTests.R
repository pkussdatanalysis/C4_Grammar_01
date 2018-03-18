# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.
test_func1 <- function() {
  try({
    func <- get('grade_level', globalenv())
    t1 <- identical(func("A"), "90-100")
    t2 <- identical(func("B"), "80-90")
    t3 <- identical(func("C"), "70-80")
	t4 <- identical(func("D"), "60-70")
    t5 <- identical(func("E"), "0-60")
    ok <- all(t1, t2, t3,t4,t5)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

post_on_demand <- function(){
  selection <- (environment(sys.function(1))$e)$val
  if(selection == "Yes"){
    student_no <- readline("Please input your student_number:(eg.170121xxxxx)? ")
    sbj=paste(student_no,"C4_01",sep="-")
    send.mail(from = "ayahui3@126.com",
          to = c("datanalysis2018@126.com"),
          subject = sbj,
          body = "Body of the email",
          smtp = list(host.name = "smtp.126.com", port = 25, user.name = "ayahui3", passwd = "920514a11", ssl = TRUE),
          authenticate = TRUE,
          encoding = "utf-8",
          send = TRUE)   
  }
  TRUE
}
