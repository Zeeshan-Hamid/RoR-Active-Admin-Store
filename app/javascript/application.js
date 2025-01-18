// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap";
import "bootstrap/dist/js/bootstrap.bundle";



document.addEventListener('DOMContentLoaded', () => {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach((alert) => {
      setTimeout(() => {
        alert.style.display = 'none';
      }, 3000); 
    });
  });
  