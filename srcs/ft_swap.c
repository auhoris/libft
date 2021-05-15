/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_swap.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vlados_paperos <marvin@42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/29 15:14:52 by vlados_pa         #+#    #+#             */
/*   Updated: 2021/05/15 13:46:37 by auhoris          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

void	swap(void *a, void *b, size_t size)
{
	char	tmp;
	size_t	i;

	i = 0;
	while (i < size)
	{
		tmp = *((char *) b + i);
		*((char *) b + i) = *((char *) a + i);
		*((char *) a + i) = tmp;
		i++;
	}
}
