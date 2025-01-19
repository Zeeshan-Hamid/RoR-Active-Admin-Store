// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"

import "popper"
import "bootstrap"

import "controllers"



document.addEventListener('DOMContentLoaded', () => {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach((alert) => {
      setTimeout(() => {
        alert.style.display = 'none';
      }, 3000); 
    });
  });
  import * as bootstrap from "bootstrap"
