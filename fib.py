import plotly.graph_objects as go

# --- Função para gerar sequência de Fibonacci ---


def fibonacci_sequence(n):
    seq = [0, 1]
    for i in range(2, n + 1):
        seq.append(seq[-1] + seq[-2])
    return seq[:n + 1]


# --- Entrada do usuário ---
x = int(input("Digite a posição máxima da sequência de Fibonacci: "))

# --- Geração da sequência ---
fib = fibonacci_sequence(x)
indices = list(range(len(fib)))

# --- Cálculo das médias F(n)/n ---
medias = [fib[i] / i**10 if i != 0 else 0 for i in range(len(fib))]

# --- Criação do gráfico interativo ---
fig = go.Figure()

# Linha de Fibonacci
# fig.add_trace(go.Scatter(
#     x=indices,
#     y=fib,
#     mode='lines+markers',
#     name='Fibonacci',
#     hovertemplate='n=%{x}<br>F(n)=%{y}',
#     line=dict(color='royalblue')
# ))

# Linha da média F(n)/n
fig.add_trace(go.Scatter(
    x=indices,
    y=medias,
    mode='lines+markers',
    name='F(n)/n',
    hovertemplate='n=%{x}<br>F(n)/n=%{y:.4f}',
    line=dict(color='orange', dash='dash')
))

# --- Layout ---
fig.update_layout(
    title=f"Sequência de Fibonacci e Média F(n)/n até n = {x}",
    xaxis_title="n (posição na sequência)",
    yaxis_title="Valor",
    hovermode='x unified',
    template='plotly_white'
)

# --- Exibição ---
fig.show()
