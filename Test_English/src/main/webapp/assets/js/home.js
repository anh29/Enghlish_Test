
  document.addEventListener('DOMContentLoaded', function () {
    const carousel = document.querySelector('.carousel');
    const wrapper = document.querySelector('.wrapper');
    const leftButton = document.getElementById('left');
    const rightButton = document.getElementById('right');
    const cardWidth = document.querySelector('.carousel .card').offsetWidth;
    const cardsInView = 3;

    function centerCarousel() {
      const itemsCount = document.querySelectorAll('.carousel .card').length;
      const wrapperWidth = wrapper.offsetWidth;
      const carouselWidth = Math.min(itemsCount * cardWidth, cardsInView * cardWidth);

      if (carouselWidth < wrapperWidth) {
        const offset = (wrapperWidth - carouselWidth) / 2;
        carousel.style.marginLeft = offset + 'px';
        carousel.style.width = carouselWidth + 'px';
      } else {
        carousel.style.marginLeft = '0';
        carousel.style.width = '100%';
      }
    }

    function handleNavigation(direction) {
      const scrollAmount = cardsInView * cardWidth * direction;
      carousel.scrollLeft += scrollAmount;
    }

    leftButton.addEventListener('click', function () {
      handleNavigation(-1);
    });

    rightButton.addEventListener('click', function () {
      handleNavigation(1);
    });

    window.addEventListener('resize', function () {
      centerCarousel();
    });

    centerCarousel();
  });