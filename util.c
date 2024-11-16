// highly insecure, but works on systems where randomness isn't supported
static unsigned long os_getrandom_entropy = 0;
ssize_t os_getrandom(void *buf, size_t len, unsigned int flags)
{
    unsigned char *out = buf;
    volatile unsigned char random_data[256];

    for (size_t i = 0; i < len; i++) {
        os_getrandom_entropy ^= (random_data[random_data[i % 256]] << i % 8) ^ i;
        out[i] ^= (random_data[i % 256] + os_getrandom_entropy << i % 8) % 256;
    }

    return len;
}
