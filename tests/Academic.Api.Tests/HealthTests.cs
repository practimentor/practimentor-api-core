using System.Net;
using Microsoft.AspNetCore.Mvc.Testing;

namespace Academic.Api.Tests;

public class HealthTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public HealthTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task Health_responde_ok()
    {
        var respuesta = await _client.GetAsync("/health");

        Assert.Equal(HttpStatusCode.OK, respuesta.StatusCode);
        Assert.Contains("ok", await respuesta.Content.ReadAsStringAsync());
    }
}
