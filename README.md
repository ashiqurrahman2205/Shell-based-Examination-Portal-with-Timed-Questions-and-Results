# 🎓 Interactive Examination Portal with Timed Questions and Result Analytics  

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

## 🚧 Installation  

1. Clone this repository:  
   ```bash
   git clone https://github.com/ashiqurrahman2205/Shell-based-Examination-Portal-with-Timed-Questions-and-Results.git
   cd Shell-based-Examination-Portal-with-Timed-Questions-and-Results
   ```
2. Ensure all the files (correctans.txt, questionbank.txt, etc.) are in the same directory as the script.

3. Assign execute permission to the script:
   ```bash
   chmod +x final_main_file.sh
   ```
## 🛠️ Usage

1. Run the script:
   ```bash
   ./final_main_file.sh
   ```
Follow the prompts to:
   - 🔑 Sign In to an existing account.
   - 🆕 Sign Up to create a new account.
   - 📝 Take the test and view results.
   
## 📁 File Structure
```plaintext
├── correctans.txt       # Stores the correct answers for evaluation.
├── final_main_file.sh   # The main Bash script file for the portal.
├── log.txt              # Logs user sign-ins with timestamps.
├── mark_record.txt      # Records scores achieved by each user.
├── password.csv         # Stores encrypted passwords for user accounts.
├── questionbank.txt     # Stores the test questions in blocks of 5 lines.
├── userans.txt          # Logs user responses during the test.
├── username.csv         # Stores registered usernames.
├──license               #Information on license
```
## 🎥 Demo  

Watch the Demo on YouTube to see the portal in action:  

- 🔑 User logging in and taking the test.  
- ⏲️ Timed question interface.  
- 🌈 Decorative UI and animations.  
- 🏁 Final result screen.  

**[📺 Watch the demo video here]([https://www.youtube.com/watch?v=yourvideoid](https://www.youtube.com/watch?v=GTqOrfYQNdI))**  
## 🤝 Contribution  

Contributions are welcome! To enhance this project:  
1. Fork the repository.  
2. Create a new feature branch.  
3. Submit a pull request.  

## 📜 License  

This project is licensed under the MIT License.  


