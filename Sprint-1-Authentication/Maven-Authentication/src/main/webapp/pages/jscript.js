document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('loginForm');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');

    // Regular expression for structural email verification
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Helper functions to inject error messages and toggle layouts
    function showError(input, errorSpan, message) {
        input.classList.add('invalid');
        errorSpan.textContent = message;
    }

    function clearError(input, errorSpan) {
        input.classList.remove('invalid');
        errorSpan.textContent = '';
    }

    // Email input field logic
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

    // Password input field logic
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

    // Bind real-time input event listeners for instant validation feedback
    emailInput.addEventListener('input', validateEmail);
    passwordInput.addEventListener('input', validatePassword);

    // Overarching form interception logic
    form.addEventListener('submit', (event) => {
        event.preventDefault(); // Prevents default page refreshing on post flags

        const isEmailValid = validateEmail();
        const isPasswordValid = validatePassword();

        if (isEmailValid && isPasswordValid) {
            alert('Validation successful! Proceeding to background authentication.');
            // This is where you pass user details securely over fetch/axios to your backend database APIs
            console.log('Authenticating payload data:', {
                username: emailInput.value,
                password: passwordInput.value
            });
        }
    });
});
