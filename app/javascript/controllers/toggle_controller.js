import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["capsule", "tabBtn", "message", "photo", "video", "audio", "rocketIcon"]

  connect() {
    console.log('Toggle controller connected')
  }

  toggleNavTab() {
    console.log(this.capsuleTargets)
    this.capsuleTargets.forEach(target => {
      target.classList.toggle("d-none")
    })
    this.tabBtnTargets.forEach(target => {
      target.classList.toggle("tab-active")
    })
    this.rocketIconTargets.forEach(target => {
      target.classList.toggle("d-none")
    })
  }

  toggleMessages() {
    this.messageTargets.forEach(message => {
      message.classList.toggle("d-none")
    })
  }

  togglePhotos() {
    this.photoTargets.forEach(photo => {
      photo.classList.toggle("d-none")
    })
  }


  toggleVideos() {
    this.videoTargets.forEach(video => {
      video.classList.toggle("d-none")
    })
  }


  toggleAudios() {
    this.audioTargets.forEach(audio => {
      audio.classList.toggle("d-none")
    })
  }
}
