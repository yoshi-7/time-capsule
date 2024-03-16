import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fullscreen-img"
export default class extends Controller {
  static targets = ["img"]

  connect() {
    console.log('full screen connected')
  }

  fullscreen(event) {
    const photoSrc = event.currentTarget.getAttribute('src');
    console.log(photoSrc)
    const enlargedPhoto = document.createElement('img');
    enlargedPhoto.src = photoSrc;
    enlargedPhoto.style = `
      position: fixed;
      max-width: 80%;
      max-height: 80%;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 1000;
      cursor: zoom-out;
    `;
    document.body.appendChild(enlargedPhoto);

     // Add an overlay
     const overlay = document.createElement('div');
     overlay.style = `
       position: fixed;
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;
       background-color: rgba(0, 0, 0, 0.5);
       z-index: 999;
     `;
     document.body.appendChild(overlay);

    // Click event to remove the enlarged photo and overlay
    enlargedPhoto.addEventListener('click', () => {
      enlargedPhoto.remove();
      overlay.remove();
    });
  }


}
