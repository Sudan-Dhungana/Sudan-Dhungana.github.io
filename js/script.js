// Smooth scrolling for navigation links
document.querySelectorAll('.menu a').forEach(link => {
    link.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href').substring(1);
        const targetElement = document.getElementById(targetId);

        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop,
                behavior: 'smooth'
            });
        }
    });
});

// Highlight active menu item on scroll
// const sections = document.querySelectorAll('main > div');
// const menuLinks = document.querySelectorAll('.menu a');

// window.addEventListener('scroll', () => {
//     let currentSection = '';

//     sections.forEach(section => {
//         const sectionTop = section.offsetTop - 50;
//         const sectionHeight = section.offsetHeight;
//         if (window.scrollY >= sectionTop && window.scrollY < sectionTop + sectionHeight) {
//             currentSection = section.getAttribute('id');
//         }
//     });

//     menuLinks.forEach(link => {
//         link.classList.remove('active');
//         if (link.getAttribute('href').substring(1) === currentSection) {
//             link.classList.add('active');
//         }
//     });
// });

// Hover effect for social icons
document.querySelectorAll('.social-container a').forEach(icon => {
    icon.addEventListener('mouseover', () => {
        icon.style.transform = 'scale(1.2)';
        icon.style.transition = 'transform 0.3s ease';
    });

    icon.addEventListener('mouseout', () => {
        icon.style.transform = 'scale(1)';
    });
});

// Sticky navigation bar with default style when at the top
const nav = document.querySelector('nav'); // Replace 'nav' with your navigation bar selector
const navOffsetTop = nav.offsetTop;

window.addEventListener('scroll', () => {
    if (window.scrollY > navOffsetTop) {
        nav.classList.add('sticky');
    } else {
        nav.classList.remove('sticky');
    }
});

// Marquee pause on hover
const marquee = document.querySelector('marquee');
if (marquee) {
    marquee.addEventListener('mouseover', () => {
        marquee.stop();
    });

    marquee.addEventListener('mouseout', () => {
        marquee.start();
    });
}

// Back-to-top button functionality
const backToTopButton = document.createElement('button');
backToTopButton.textContent = '↑';
backToTopButton.classList.add('back-to-top');
document.body.appendChild(backToTopButton);

window.addEventListener('scroll', () => {
    if (window.scrollY > 100) {
        backToTopButton.style.display = 'block';
    } else {
        backToTopButton.style.display = 'none';
    }
});

backToTopButton.addEventListener('click', () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// Toggle mobile menu
const menuToggle = document.querySelector('.menu-toggle');
const menu = document.querySelector('.menu');

if (menuToggle && menu) {
    menuToggle.addEventListener('click', () => {
        menu.classList.toggle('open');
        menuToggle.classList.toggle('active');
    });
}