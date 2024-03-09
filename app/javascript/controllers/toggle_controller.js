import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "message", "photo", "video", "audio", "toggleIcon"]

  connect() {
    console.log('Toggle controller connected')
  }

  toggleNavTab() {
    this.capsuleTargets.forEach(capsule => {
      capsule.classList.toggle("d-none")
    });
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active")
    })
  }

  toggleMessages() {
    this.messageTargets.forEach(message => {
      message.classList.toggle("d-none")
    })
    this.toggleIconTarget.style.transform = 'rotate(180deg)'
  }

  togglePhotos() {
    this.photoTargets.forEach(photo => {
      photo.classList.toggle("d-none")
    })
    this.toggleIconTarget.style.transform = 'rotate(180deg)'
  }


  toggleVideos() {
    this.videoTargets.forEach(video => {
      video.classList.toggle("d-none")
    })
    this.toggleIconTarget.style.transform = 'rotate(180deg)'
  }


  toggleAudios() {
    this.audioTargets.forEach(audio => {
      audio.classList.toggle("d-none")
    })
    this.toggleIconTarget.style.transform = 'rotate(180deg)'
  }
}
