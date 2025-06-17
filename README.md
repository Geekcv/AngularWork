@if (role == 1) {
    <div class="flex min-w-0 flex-auto flex-col">
        <!-- Main -->
        <div class="flex-auto p-6 sm:p-10">
            <div
                class="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-end"
            >
                <!-- Button Group (aligned in a row on large screens) -->
                <div class="flex items-center justify-center gap-3">
                    <!-- Search  Field -->
                    <mat-form-field
                        class="w-full sm:w-72"
                        [subscriptSizing]="'dynamic'"
                    >
                        <mat-icon
                            matPrefix
                            class="icon-size-5"
                            [svgIcon]="'heroicons_solid:magnifying-glass'"
                        >
                        </mat-icon>
                        <input
                            (input)="filterByQuery(query.value)"
                            placeholder="Search  Patients"
                            matInput
                            #query
                        />
                    </mat-form-field>

                    <!-- Refresh Button -->
                    <button mat-icon-button (click)="refresh()">
                        <!-- <mat-icon class="icon-size-7">refresh</mat-icon> -->
                        <i
                            class="fi fi-rr-refresh"
                            [ngStyle]="{
                                color: 'blue',
                            }"
                        ></i>
                    </button>

                    <!-- Cloumn filter-->
                    <button mat-icon-button (click)="cloumnshow()">
                        <!-- <mat-icon>filter_alt</mat-icon> -->
                        <i
                            class="fi fi-tr-filters"
                            [ngStyle]="{
                                color: 'blue',
                            }"
                        ></i>
                    </button>

                    <!-- Filter Button -->
                    <!-- <button mat-icon-button (click)="toggleFilterPanel()">
                        <mat-icon>filter_list</mat-icon>
                    </button> -->

                    <!-- Add Doctor Button -->
                    <button mat-icon-button (click)="addpatientdialog()">
                        <!-- <mat-icon class="icon-size-7">control_point</mat-icon> -->
                        <i class="fi fi-ss-add"></i>
                    </button>
                </div>
            </div>

            <div
                class="w-full max-w-full rounded-2xl border border-gray-300 bg-white p-4 shadow-lg"
            >
                <div class="overflow-auto rounded-lg">
                    <table
                        mat-table
                        [dataSource]="patient"
                        class="mat-elevation-z8 w-full min-w-[600px]"
                        matSort
                        [trackBy]="trackByFn"
                    >
                        @for (column of columns; track column) {
                            <ng-container
                                [matColumnDef]="column.name"
                                [stickyEnd]="column.name === 'actions'"
                                [hidden]="!column.visible"
                            >
                                <!-- Header Cell -->
                                <th
                                    mat-header-cell
                                    *matHeaderCellDef
                                    mat-sort-header
                                    class="z-10 h-14 px-20 text-center"
                                >
                                    {{ column.label }}
                                </th>

                                <!-- Data Cell -->
                                <td
                                    mat-cell
                                    *matCellDef="let element; let i = index"
                                    class="align-middle px-2 py-2 text-center"
                                    [ngClass]="{
                                        'flex items-center justify-center gap-2 bg-white':
                                            column.name === 'actions',
                                        'border-l border-gray-300':
                                            column.name === 'actions',
                                    }"
                                >
                                    <ng-container [ngSwitch]="column.name">
                                        <span *ngSwitchCase="'user_row_id'">
                                            {{
                                                i +
                                                    1 +
                                                    patient.paginator
                                                        .pageIndex *
                                                        patient.paginator
                                                            .pageSize
                                            }}
                                        </span>

                                        <!-- Editable Fields -->
                                        <ng-container
                                            *ngSwitchCase="'patient_name'"
                                        >
                                            <ng-container
                                                *ngIf="
                                                    isRowEditing(
                                                        element.user_row_id
                                                    );
                                                    else readName
                                                "
                                            >
                                                <input
                                                    matInput
                                                    class="rounded border p-1"
                                                    [(ngModel)]="
                                                        element.patient_name
                                                    "
                                                />
                                            </ng-container>
                                            <ng-template #readName>{{
                                                element.patient_name
                                            }}</ng-template>
                                        </ng-container>

                                        <ng-container
                                            *ngSwitchCase="'patient_email'"
                                        >
                                            <ng-container
                                                *ngIf="
                                                    isRowEditing(
                                                        element.user_row_id
                                                    );
                                                    else readEmail
                                                "
                                            >
                                                <input
                                                    matInput
                                                    class="rounded border p-1"
                                                    [(ngModel)]="
                                                        element.patient_email
                                                    "
                                                />
                                            </ng-container>
                                            <ng-template #readEmail>{{
                                                element.patient_email
                                            }}</ng-template>
                                        </ng-container>

                                        <ng-container
                                            *ngSwitchCase="
                                                'user_contact_number'
                                            "
                                        >
                                            <ng-container
                                                *ngIf="
                                                    isRowEditing(
                                                        element.user_row_id
                                                    );
                                                    else readContact
                                                "
                                            >
                                                <input
                                                    matInput
                                                    class="rounded border p-1"
                                                    [(ngModel)]="
                                                        element.user_contact_number
                                                    "
                                                />
                                            </ng-container>
                                            <ng-template #readContact>{{
                                                element.user_contact_number
                                            }}</ng-template>
                                        </ng-container>

                                        <ng-container
                                            *ngSwitchCase="'qualifications'"
                                        >
                                            <ng-container
                                                *ngIf="
                                                    isRowEditing(
                                                        element.user_row_id
                                                    );
                                                    else readQual
                                                "
                                            >
                                                <input
                                                    matInput
                                                    class="rounded border p-1"
                                                    [(ngModel)]="
                                                        element.qualifications
                                                    "
                                                />
                                            </ng-container>
                                            <ng-template #readQual>{{
                                                element.qualifications
                                            }}</ng-template>
                                        </ng-container>

                                        <ng-container
                                            *ngSwitchCase="
                                                'qualifications_details'
                                            "
                                        >
                                            <ng-container
                                                *ngIf="
                                                    isRowEditing(
                                                        element.user_row_id
                                                    );
                                                    else readQualDet
                                                "
                                            >
                                                <input
                                                    matInput
                                                    class="rounded border p-1"
                                                    [(ngModel)]="
                                                        element.qualifications_details
                                                    "
                                                />
                                            </ng-container>
                                            <ng-template #readQualDet>{{
                                                element.qualifications_details
                                            }}</ng-template>
                                        </ng-container>

                                        <!-- Actions Column -->
                                        <ng-container *ngSwitchCase="'actions'">
                                            <ng-container
                                                *ngIf="
                                                    isRowEditing(
                                                        element.user_row_id
                                                    );
                                                    else actionButtons
                                                "
                                            >
                                                <button
                                                    mat-icon-button
                                                    (click)="saveRow(element)"
                                                >
                                                    <!-- <mat-icon>save</mat-icon> -->
                                                    <i
                                                        class="fi fi-tr-floppy-disks"
                                                    ></i>
                                                </button>
                                                <button
                                                    mat-icon-button
                                                    (click)="cancelEdit()"
                                                >
                                                    <!-- <mat-icon>close</mat-icon> -->
                                                    <i
                                                        class="fi fi-tr-circle-xmark"
                                                    ></i>
                                                </button>
                                            </ng-container>
                                            <ng-template #actionButtons>
                                                <!-- Login -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="Login"
                                                >
                                                    <!-- <img
                                                        class="h-6 w-6"
                                                        src="images/logo/login.svg"
                                                    /> -->
                                                    <i
                                                        class="fi fi-tr-entrance"
                                                    ></i>
                                                </button>

                                                <!-- Edit -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="Edit"
                                                    (click)="
                                                        editRow(
                                                            element.user_row_id
                                                        )
                                                    "
                                                >
                                                    <!-- <mat-icon>edit</mat-icon> -->
                                                    <i
                                                        class="fi fi-tr-text-box-edit"
                                                    ></i>
                                                </button>

                                                <button
                                                    mat-icon-button
                                                    matTooltip="Delete"
                                                    (click)="deletebtn(element)"
                                                >
                                                    <i
                                                        class="fi fi-rs-trash"
                                                        [ngStyle]="{
                                                            color:
                                                                selectedRow?.user_row_id ===
                                                                    element.user_row_id &&
                                                                selectedAction ===
                                                                    'delete'
                                                                    ? 'red'
                                                                    : visitedActions[
                                                                            element
                                                                                .user_row_id
                                                                        ]?.includes(
                                                                            'delete'
                                                                        )
                                                                      ? 'yellow'
                                                                      : 'blue',
                                                        }"
                                                    ></i>
                                                </button>

                                                <!-- View -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="View Details"
                                                    (click)="
                                                        viewpatientDetails(
                                                            element.user_row_id
                                                        )
                                                    "
                                                >
                                                    <!-- <mat-icon
                                                        >visibility</mat-icon
                                                    > -->
                                                    <i
                                                        class="fi fi-tr-overview"
                                                        [ngStyle]="{
                                                            color: 'green',
                                                        }"
                                                    ></i>
                                                </button>

                                                <!-- Suspend -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="Suspend Patient"
                                                    (click)="
                                                        suspendPatient(element)
                                                    "
                                                >
                                                    <!-- <mat-icon
                                                        >pause_presentation</mat-icon
                                                    > -->
                                                    <i
                                                        class="fi fi-ts-dot-circle"
                                                    ></i>
                                                </button>

                                                <!-- Lock -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="Lock Account"
                                                >
                                                    <!-- <mat-icon>lock</mat-icon> -->
                                                    <i
                                                        class="fi fi-tr-password-lock"
                                                    ></i>
                                                </button>
                                            </ng-template>
                                        </ng-container>
                                    </ng-container>
                                </td>
                            </ng-container>
                        }

                        <!-- Header Row -->
                        <tr
                            mat-header-row
                            *matHeaderRowDef="displayedColumns"
                            class="bg-gray-200 text-sm font-bold md:text-lg"
                        ></tr>

                        <!-- Data Row -->
                        <tr
                            mat-row
                            *matRowDef="let row; columns: displayedColumns"
                        ></tr>
                    </table>
                </div>

                <!-- Conditional Paginator -->
                @if (!isSearchActive) {
                    <div
                        class="mt-4 flex flex-col items-center justify-between gap-2 border-t pt-4 sm:flex-row"
                    >
                        <span class="text-xs text-gray-500 sm:text-sm"
                            >Showing {{ patient.data.length }} patients</span
                        >
                        <mat-paginator
                            [pageSize]="10"
                            [pageSizeOptions]="[5, 10, 20, 30, 40]"
                            showFirstLastButtons
                        >
                        </mat-paginator>
                    </div>
                }
            </div>
        </div>
    </div>
}




import { Component, ViewChild } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { Router } from '@angular/router';
import { ApicontrollerService } from 'app/controller/apicontroller.service';

import { CommonModule } from '@angular/common';
import { ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatTooltipModule } from '@angular/material/tooltip';
import { DeldialogComponent } from '../../dialog/deldialog/deldialog.component';
import { AddpatientdialogComponent } from '../../dialog/doctor/addpatientdialog/addpatientdialog.component';
import { CloumnShowdialogComponent } from '../../dialog/doctor/cloumn-showdialog/cloumn-showdialog.component';
import { SuspendPatientComponent } from '../../dialog/suspend-patient/suspend-patient.component';

interface Patient {
    patient_age: string;
    patient_email: string;
    patient_gender: string;
    patient_name: string;
    user_contact_number: string;
    user_password: string;
    user_row_id: string;
    qualifications_details: string;
    qualifications: string;
}

interface Column {
    name: string; // The column name/key (must match MatTable's columnDef)
    label: string; // The displayed label for checkbox and header
    visible: boolean; // Whether this column is currently shown
}

@Component({
    selector: 'app-viewpatients',
    // encapsulation: ViewEncapsulation.None,
    // changeDetection: ChangeDetectionStrategy.OnPush,

    imports: [
        MatTableModule,
        MatButtonModule,
        MatIconModule,
        MatInputModule,
        MatPaginatorModule,
        CommonModule,
        FormsModule,
        MatSortModule,
        MatTooltipModule,
    ],
    templateUrl: './viewpatients.component.html',
    styleUrl: './viewpatients.component.css',
})
export class ViewpatientsComponent {
    // displayedColumns: string[] = [
    //   'user_row_id',
    //   'patient_name',
    //   'patient_email',
    //   'user_contact_number',
    //   'qualifications',
    //   'qualifications_details',
    //   'actions'
    // ];

    columns: Column[] = [
        { name: 'user_row_id', label: 'ID', visible: true },
        { name: 'patient_name', label: 'Name', visible: true },
        { name: 'patient_email', label: 'Email', visible: true },
        { name: 'user_contact_number', label: 'Contact Number', visible: true },
        { name: 'qualifications', label: 'Qualifications', visible: true },
        {
            name: 'qualifications_details',
            label: 'Qualification Details',
            visible: true,
        },
        { name: 'actions', label: 'Actions', visible: true },
    ];

    role: any = '';
    patient = new MatTableDataSource<Patient>([]);

    @ViewChild(MatPaginator) paginator!: MatPaginator;
    @ViewChild(MatSort) sort!: MatSort;

    constructor(
        private Apicontroller: ApicontrollerService,
        private router: Router,
        private _matDialog: MatDialog,
        private cdRef: ChangeDetectorRef // Add this
    ) {
        this.role = localStorage.getItem('role');
    }

    ngOnInit(): void {
        this.Patients();
    }

    ngAfterViewInit() {
        this.patient.paginator = this.paginator;
        this.patient.sort = this.sort;
    }

    page: number = 1;

    async Patients() {
        try {
            const resp = await this.Apicontroller.fetchPatients(
                'common',
                this.page
            );
            this.patient.data = resp.data as Patient[];
        } catch (error) {
            console.error('Error fetching patients:', error);
        }
    }

    trackByFn(index: number, item: any) {
        return item.name; // Or unique identifier
    }

    viewDoctorDetails(patient: Patient) {
        this.router.navigate(['patientDetails', patient.user_row_id]);
    }

    refresh() {
        this.Patients();
    }

    addpatientdialog() {
        this._matDialog.open(AddpatientdialogComponent, {
            position: { right: '1%' },
        });
    }

    selectedRow: any = null;
selectedAction: string = '';
visitedActions: { [key: string]: string[] } = {};

deletebtn(row: any): void {
  this.selectedRow = row;
  this.selectedAction = 'delete';

  const id = row.user_row_id;

  if (!this.visitedActions[id]) {
    this.visitedActions[id] = [];
  }

  if (!this.visitedActions[id].includes('delete')) {
    this.visitedActions[id].push('delete');
  }

  this._matDialog.open(DeldialogComponent, {
    data: { patient: row },
  });
}

    

    viewpatientDetails(patient_rowId: string) {
        this.router.navigate(['patientpanel', patient_rowId]);
    }

    get displayedColumns(): string[] {
        return this.columns.filter((c) => c.visible).map((c) => c.name);
    }

    cloumnshow() {
        const dialogRef = this._matDialog.open(CloumnShowdialogComponent, {
            position: { right: '1%' },
            data: { columns: this.columns },
        });

        dialogRef.afterClosed().subscribe((result: Column[] | undefined) => {
            console.log('res', result);
            if (result) {
                // Update visibility based on dialog result
                result.forEach((colFromDialog) => {
                    const col = this.columns.find(
                        (c) => c.name === colFromDialog.name
                    );
                    if (col) {
                        col.visible = colFromDialog.visible;
                    }
                });
                // The getter will recalc displayedColumns automatically
            }
        });
    }

    isSearchActive = false;

    suspendPatient(patient: any) {
        this._matDialog.open(SuspendPatientComponent, {
            data: { patient: patient },
        });
    }

    editRowId: number | null = null;

    editRow(rowId: number) {
        this.editRowId = rowId;
    }

    async saveRow(row: any) {
        this.editRowId = null;
        try {
            const resp = await this.Apicontroller.updatePatients('common', row);
            console.log('Patients update data:', resp);
        } catch (error) {
            console.error('Error updating patients:', error);
        }
    }

    cancelEdit() {
        this.editRowId = null;
    }

    displayheaderdata: any;

    isRowEditing(rowId: any) {
        return this.editRowId === rowId;
    }
}



 <link
            rel="stylesheet"
            href="https://cdn-uicons.flaticon.com/3.0.0/uicons-regular-straight/css/uicons-regular-straight.css"
        />
        <link
            rel="stylesheet"
            href="https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css"
        />
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-straight/css/uicons-thin-straight.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-thin-rounded/css/uicons-thin-rounded.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-solid-straight/css/uicons-solid-straight.css'>
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    </head>
