#PasswordChecker.new.check_password(email, password)

class PasswordChecker
  def check_password(email, password)
    puts characters(password)
    puts content_symbols(password)
    puts content_case(password) 
    puts !content_name(email, password)

    characters(password) && content_symbols(password) && content_case(password) && !content_name(email, password)
  end

  def characters(password)
    password.length >= 7 
  end

  def content_symbols(password)
    condition = false 
    if password.split(/\W/).length > 1 && password.split(/[a-z]/).length > 1 && password.split(/[A-Z]/).length > 1
      condition = true
    end
      condition
  end

  def content_case(password)
    check_lowercase(password) && check_uppercase(password)
  end

  def check_lowercase(password)
    condition = false
    password.each_char do |i|      
      condition = true if i >= "a" && i <= "z"
    end
    condition
  end

  def check_uppercase(password)
    condition = false
    password.each_char do |i|      
      condition = true if i >= "A" && i <= "Z"
    end
    condition
  end

  def get_name(email)
    email.split("@")[0]
  end

  def content_name(email, password)
    condition = false
    if password.index(get_name(email)) 
      condition = true
    else
      condition = false
    end
    condition  
  end






end
