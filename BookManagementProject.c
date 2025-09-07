#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    int bookId;
    char bookname[50];
    char author[50];
    char category[100];
    float price;
    float rating;
} Book;

Book *books = NULL;
int count = 0;

// Function declarations
void addBooks();
void displayAllBooks();
void removeBooks();
void searchBooks();
void showAuthorBooks();
void showCategoryBooks();
void updateBooks();
void displaySortedBooks();

int main()
{
    int choice;

    do
    {
        printf("\n========== Book Management System ==========\n");
        printf("1. Add Book\n");
        printf("2. Remove Book\n");
        printf("3. Search Book\n");
        printf("4. Show Author's Books\n");
        printf("5. Show Category's Books\n");
        printf("6. Update Book\n");
        printf("7. Display Sorted Books\n");
        printf("8. Display All Books\n");
        printf("0. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            addBooks();
            break;
        case 2:
            removeBooks();
            break;
        case 3:
            searchBooks();
            break;
        case 4:
            showAuthorBooks();
            break;
        case 5:
            showCategoryBooks();
            break;
        case 6:
            updateBooks();
            break;
        case 7:
            displaySortedBooks();
            break;
        case 8:
            displayAllBooks();
            break;
        case 0:
            printf("\nExiting program...\n");
            break;
        default:
            printf("\nInvalid choice! Please try again.\n");
        }
    } while (choice != 0);

    return 0;
}

// Add books
void addBooks()
{
    int n, i;
    printf("\nHow many books do you want to add? ");
    scanf("%d", &n);

    books = (Book *)realloc(books, (count + n) * sizeof(Book));

    for (i = 0; i < n; i++)
    {
        printf("\nEnter details for Book %d:\n", count + 1);

        printf("Enter Book Id: ");
        scanf("%d", &books[count].bookId);

        printf("Enter Book Name: ");
        scanf("%s", books[count].bookname);

        printf("Enter Author Name: ");
        scanf("%s", books[count].author);

        printf("Enter Category: ");
        scanf("%s", books[count].category);

        printf("Enter Price: ");
        scanf("%f", &books[count].price);

        printf("Enter Rating: ");
        scanf("%f", &books[count].rating);

        count++;
        printf("Book added successfully!\n");
    }
}

// Display all books
void displayAllBooks()
{
    int i;
    if (count == 0)
    {
        printf("\nNo books to display.\n");
        return;
    }

    printf("\n------- All Books -------\n");
    for (i = 0; i < count; i++)
    {
        printf("\nId = %d", books[i].bookId);
        printf("\nName = %s", books[i].bookname);
        printf("\nAuthor = %s", books[i].author);
        printf("\nCategory = %s", books[i].category);
        printf("\nPrice = %.2f", books[i].price);
        printf("\nRating = %.2f\n", books[i].rating);
    }
}

// Remove book
void removeBooks()
{
    int id, flag = 0, i, j;
    printf("\nEnter Book ID to remove: ");
    scanf("%d", &id);

    for (i = 0; i < count; i++)
    {
        if (books[i].bookId == id)
        {
            for (j = i; j < count - 1; j++)
            {
                books[j] = books[j + 1];
            }
            count--;
            books = (Book *)realloc(books, count * sizeof(Book));
            printf("Book removed successfully!\n");
            flag = 1;
            break;
        }
    }

    if (!flag)
    {
        printf("Book not found.\n");
    }
}

// Search book
void searchBooks()
{
    int choice, i, id, flag = 0;
    char name[50];

    printf("\nSearch by 1.Id or 2.Name: ");
    scanf("%d", &choice);

    if (choice == 1)
    {
        printf("Enter Book Id: ");
        scanf("%d", &id);

        for (i = 0; i < count; i++)
        {
            if (books[i].bookId == id)
            {
                printf("\nBook Found: %s by %s\n", books[i].bookname, books[i].author);
                flag = 1;
                break;
            }
        }
        if (!flag)
            printf("Book not found.\n");
    }
    else if (choice == 2)
    {
        printf("Enter Book Name: ");
        scanf("%s", name);

        for (i = 0; i < count; i++)
        {
            if (strcmp(books[i].bookname, name) == 0)
            {
                printf("\nBook Found: ID=%d, Author=%s\n", books[i].bookId, books[i].author);
                flag = 1;
                break;
            }
        }
        if (!flag)
            printf("Book not found.\n");
    }
    else
    {
        printf("Invalid choice.\n");
    }
}

// Show books by specific author
void showAuthorBooks()
{
    char author[50];
    int i, flag = 0;
    printf("\nEnter author name: ");
    scanf("%s", author);

    for (i = 0; i < count; i++)
    {
        if (strcmp(books[i].author, author) == 0)
        {
            printf("%s\n", books[i].bookname);
            flag = 1;
        }
    }
    if (!flag)
        printf("No books found for this author.\n");
}

// Show books by category
void showCategoryBooks()
{
    char category[100];
    int i, flag = 0;
    printf("\nEnter Category: ");
    scanf("%s", category);

    for (i = 0; i < count; i++)
    {
        if (strcmp(books[i].category, category) == 0)
        {
            printf("%s\n", books[i].bookname);
            flag = 1;
        }
    }
    if (!flag)
        printf("No books found in this category.\n");
}

// Update book
void updateBooks()
{
    int id, i, flag = 0;
    printf("\nEnter book id to update: ");
    scanf("%d", &id);

    for (i = 0; i < count; i++)
    {
        if (books[i].bookId == id)
        {
            printf("Enter new price: ");
            scanf("%f", &books[i].price);

            printf("Enter new rating: ");
            scanf("%f", &books[i].rating);

            printf("Book updated successfully!\n");
            flag = 1;
            break;
        }
    }
    if (!flag)
        printf("Book not found.\n");
}

// Display sorted books
void displaySortedBooks()
{
    int i, j;
    if (count == 0)
    {
        printf("\nNo books to sort.\n");
        return;
    }

    for (i = 0; i < count - 1; i++)
    {
        for (j = i + 1; j < count; j++)
        {
            if (books[j].price > books[i].price ||
                (books[j].price == books[i].price && books[j].rating > books[i].rating))
            {
                Book temp = books[i];
                books[i] = books[j];
                books[j] = temp;
            }
        }
    }

    printf("\nTop books (sorted by price & rating):\n");
    for (i = 0; i < count && i < 3; i++)
    {
        printf("%s - Price: %.2f, Rating: %.2f\n", books[i].bookname, books[i].price, books[i].rating);
    }
}

