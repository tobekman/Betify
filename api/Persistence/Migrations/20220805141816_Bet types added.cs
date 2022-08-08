using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Persistence.Migrations
{
    public partial class Bettypesadded : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<byte>(
                name: "AmountOfGoals",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "AwayTeamId",
                table: "Bets",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<byte>(
                name: "AwayTeamScore",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BetType",
                table: "Bets",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Discriminator",
                table: "Bets",
                type: "TEXT",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<Guid>(
                name: "HomeTeamId",
                table: "Bets",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<byte>(
                name: "HomeTeamScore",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "OneXTwoPrediction",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "OverUnderPrediction",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "OverUnder_AwayTeamId",
                table: "Bets",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<byte>(
                name: "OverUnder_AwayTeamScore",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "OverUnder_HomeTeamId",
                table: "Bets",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<byte>(
                name: "OverUnder_HomeTeamScore",
                table: "Bets",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Teams",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: false),
                    League = table.Column<string>(type: "TEXT", nullable: false),
                    Country = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teams", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Bets_AwayTeamId",
                table: "Bets",
                column: "AwayTeamId");

            migrationBuilder.CreateIndex(
                name: "IX_Bets_HomeTeamId",
                table: "Bets",
                column: "HomeTeamId");

            migrationBuilder.CreateIndex(
                name: "IX_Bets_OverUnder_AwayTeamId",
                table: "Bets",
                column: "OverUnder_AwayTeamId");

            migrationBuilder.CreateIndex(
                name: "IX_Bets_OverUnder_HomeTeamId",
                table: "Bets",
                column: "OverUnder_HomeTeamId");

            migrationBuilder.AddForeignKey(
                name: "FK_Bets_Teams_AwayTeamId",
                table: "Bets",
                column: "AwayTeamId",
                principalTable: "Teams",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Bets_Teams_HomeTeamId",
                table: "Bets",
                column: "HomeTeamId",
                principalTable: "Teams",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Bets_Teams_OverUnder_AwayTeamId",
                table: "Bets",
                column: "OverUnder_AwayTeamId",
                principalTable: "Teams",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Bets_Teams_OverUnder_HomeTeamId",
                table: "Bets",
                column: "OverUnder_HomeTeamId",
                principalTable: "Teams",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Bets_Teams_AwayTeamId",
                table: "Bets");

            migrationBuilder.DropForeignKey(
                name: "FK_Bets_Teams_HomeTeamId",
                table: "Bets");

            migrationBuilder.DropForeignKey(
                name: "FK_Bets_Teams_OverUnder_AwayTeamId",
                table: "Bets");

            migrationBuilder.DropForeignKey(
                name: "FK_Bets_Teams_OverUnder_HomeTeamId",
                table: "Bets");

            migrationBuilder.DropTable(
                name: "Teams");

            migrationBuilder.DropIndex(
                name: "IX_Bets_AwayTeamId",
                table: "Bets");

            migrationBuilder.DropIndex(
                name: "IX_Bets_HomeTeamId",
                table: "Bets");

            migrationBuilder.DropIndex(
                name: "IX_Bets_OverUnder_AwayTeamId",
                table: "Bets");

            migrationBuilder.DropIndex(
                name: "IX_Bets_OverUnder_HomeTeamId",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "AmountOfGoals",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "AwayTeamId",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "AwayTeamScore",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "BetType",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "Discriminator",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "HomeTeamId",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "HomeTeamScore",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "OneXTwoPrediction",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "OverUnderPrediction",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "OverUnder_AwayTeamId",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "OverUnder_AwayTeamScore",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "OverUnder_HomeTeamId",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "OverUnder_HomeTeamScore",
                table: "Bets");
        }
    }
}
