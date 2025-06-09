if (tempo_piscar > 0) {
    tempo_piscar--;
} else {
    timer_piscar++;

    if (timer_piscar >= 10) { // pisca a cada 10 frames
        mostrar = !mostrar;
        timer_piscar = 0;
    }
}