# Assembly compilation i386 CPU architecture Linux

We need to have `nasm` compiler and `ld` linker.

```bash
apt install nasm
apt install ld
```

## Compilation

```bash
nasm -f elf64 <asm_file.asm>
```

## Linking

```bash
ld -s -o <output_filenam> <nasm_output.o>
```

## running

```bash
./<output_filename>
```
