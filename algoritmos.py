class Main:
    def __init__(self):
        pass
    
    def get_all_ascii_regex(self):
        cores = []
        for i in range(32, 127):
            hex = Main.decimal_para_hex_6_digitos((i - 32) * 178481)
            
            if (i >= 48 and i < 58):
                hex = "00" + \
                    Main.decimal_para_hex_2_digitos((i - 48) * 12 + 147) + "00"
            elif (i >= 65 and i < 91):
                hex = Main.decimal_para_hex_2_digitos(
                    (i - 65) * 2.4519 + 128) + "0000"
            elif (i >= 97 and i < 123):
                hex = Main.decimal_para_hex_2_digitos(
                (i - 97) * 2.4519 + 128 + 63.75) + "0000"
                
            cores.append(f'#{hex}')
            
            print(f'{chr(i)}-#{hex}')
            
            
        cores_regex = list(map(lambda cor: f'({cor})', cores))
        cores_regex = '|'.join(cores_regex)
        
        return cores_regex
        
    def get_alpha_ascii_regex(self):
        cores = []
        for i in range(65, 91):
            hex = Main.decimal_para_hex_2_digitos((i - 65) * 2.4519 + 128) + "0000"
            cores.append(f'#{hex}')
            
            print(f'{chr(i)}-#{hex}', end=' ')
        for i in range(97, 123):
            hex = Main.decimal_para_hex_2_digitos((i - 97) * 2.4519 + 128 + 63.75) + "0000"
            cores.append(f'#{hex}')
            
            print(f'{chr(i)}-#{hex}', end=' ')
            
        cores_regex = list(map(lambda cor: f'({cor})', cores))
        cores_regex = '|'.join(cores_regex)
        
        return cores_regex
    
    def get_digit_ascii_regex(self):
        cores = []
        for i in range(48, 58):
            hex = "00" + Main.decimal_para_hex_2_digitos((i - 48) * 12 + 147) + "00"
            cores.append(f'#{hex}')

            print(f'{chr(i)}-#{hex}', end=' ')

        cores_regex = list(map(lambda cor: f'({cor})', cores))
        cores_regex = '|'.join(cores_regex)

        return cores_regex
    
    def get_alphanum_ascii_regex(self):
        cores = []
        
        for i in range(48, 58):
            hex = "00" + \
                Main.decimal_para_hex_2_digitos((i - 48) * 12 + 147) + "00"
            cores.append(f'#{hex}')

            print(f'{chr(i)}-#{hex}', end=' ')
        
        for i in range(65, 91):
            hex = Main.decimal_para_hex_2_digitos(
                (i - 65) * 2.4519 + 128) + "0000"
            cores.append(f'#{hex}')

            print(f'{chr(i)}-#{hex}', end=' ')
        for i in range(97, 123):
            hex = Main.decimal_para_hex_2_digitos(
                (i - 97) * 2.4519 + 128 + 63.75) + "0000"
            cores.append(f'#{hex}')

            print(f'{chr(i)}-#{hex}', end=' ')

        cores_regex = list(map(lambda cor: f'({cor})', cores))
        cores_regex = '|'.join(cores_regex)

        return cores_regex
            
    def get_minusculo_ascii_regex(self):
        cores = []
        for i in range(97, 123):
            hex = Main.decimal_para_hex_2_digitos(
                (i - 97) * 2.4519 + 128 + 63.75) + "0000"
            cores.append(f'#{hex}')

            print(f'{chr(i)}-#{hex}', end=' ')

        cores_regex = list(map(lambda cor: f'({cor})', cores))
        cores_regex = '|'.join(cores_regex)

        return cores_regex
    
    def get_maiusculo_ascii_regex(self):
        cores = []

        for i in range(65, 91):
            hex = Main.decimal_para_hex_2_digitos(
                (i - 65) * 2.4519 + 128) + "0000"
            cores.append(f'#{hex}')

            print(f'{chr(i)}-#{hex}', end=' ')
        
        cores_regex = list(map(lambda cor: f'({cor})', cores))
        cores_regex = '|'.join(cores_regex)

        return cores_regex
            
    def decimal_para_hex_6_digitos(numero_decimal):
        
        return f'{int(numero_decimal):06x}'.upper()   
         
    def decimal_para_hex_2_digitos(numero_decimal):
        
        return f'{int(numero_decimal):02x}'.upper()        
            
if (__name__ == "__main__"):
    m = Main()
    print(m.get_all_ascii_regex())
    print(m.get_minusculo_ascii_regex())
    print(m.get_maiusculo_ascii_regex())
    print(m.get_digit_ascii_regex())