document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('loginForm');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    function showError(input, errorSpan, message) {
        input.classList.add('invalid');
        errorSpan.textContent = message;
    }

    function clearError(input, errorSpan) {
        input.classList.remove('invalid');
        errorSpan.textContent = '';
    }
    function validateEmail() {
        const value = emailInput.value.trim();
        if (!value) {
            showError(emailInput, emailError, 'Email address cannot be empty.');
            return false;
        } else if (!emailRegex.test(value)) {
            showError(emailInput, emailError, 'Please enter a valid email format.');
            return false;
        } else {
            clearError(emailInput, emailError);
            return true;
        }
    }

    function validatePassword() {
        const value = passwordInput.value.trim();
        if (!value) {
            showError(passwordInput, passwordError, 'Password cannot be empty.');
            return false;
        } else if (value.length < 6) {
            showError(passwordInput, passwordError, 'Password must be at least 6 characters.');
            return false;
        } else {
            clearError(passwordInput, passwordError);
            return true;
        }
    }

    emailInput.addEventListener('input', validateEmail);
    passwordInput.addEventListener('input', validatePassword);


    form.addEventListener('submit', (event) => {
        event.preventDefault();

        const isEmailValid = validateEmail();
        const isPasswordValid = validatePassword();

        if (isEmailValid && isPasswordValid) {
            alert('Validation successful!');
        
            console.log('Authenticating payload data:', {
                username: emailInput.value,
                password: passwordInput.value
            });
        }
    });
});