# 🚀 Interactive Examination Portal with Timed Questions and Result Analytics  

## 📖 Overview  
This project is a command-line-based examination portal created using Bash scripting. It provides a secure, interactive environment for conducting tests, managing user accounts, and evaluating performance in a user-friendly format.  

## 🌟 Features  
- 🔒 **User Login System**: Includes Sign In and Sign Up functionality with password validation.  
- ⏱️ **Timed Tests**: Automatically transitions to the next question after 10 seconds.  
- 📚 **Question Bank**: Reads questions from a text file and dynamically loads them during the test.  
- 📝 **Result Generation**: Compares user answers with correct answers and calculates the score.  
- ⚠️ **Error Handling**: Alerts for invalid choices and mismatched passwords.  
- 🎨 **Decorative UI**: Colorful and visually appealing interface with animations and effects.  

## 🛠️ Prerequisites  
- 🖥️ Linux-based operating system.  
- 🐚 Bash shell (v4.0 or above).  

## 🚧 Installation & Usage  
```bash
# Clone this repository:
git clone https://github.com/ashiqurrahman2205/Shell-based-Examination-Portal-with-Timed-Questions-and-Results.git
cd exam-portal

# Add your questions to questionbank.txt:
# Ensure each question block is separated by a newline.

# Add corresponding answers to correctans.txt:
# Ensure one answer per line.

# Run the script:
./exam_portal.sh bash
```
###📁 File Structure
```bash
exam_portal.sh      # Main script file  
questionbank.txt    # Stores the questions for the test  
correctans.txt      # Stores correct answers for evaluation  
username.csv        # Logs usernames  
password.csv        # Logs passwords  
mark_record.txt     # Logs user scores  
```
