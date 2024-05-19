package controllers

import (
	"github.com/gofiber/fiber/v2"
)

func (o *Service) AuthGroupsList(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth groups list"})
	return nil
}

func (o *Service) AuthGroupsGet(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth groups get"})
	return nil
}

func (o *Service) AuthGroupsCreate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth groups create"})
	return nil
}

func (o *Service) AuthGroupsUpdate(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth groups update"})
	return nil
}

func (o *Service) AuthGroupsDelete(c *fiber.Ctx) error {
	c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "auth groups delete"})
	return nil
}
