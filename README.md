@if (role == 1) {
    <div class="flex min-w-0 flex-auto flex-col">
        <!-- Main -->
        <div class="flex-auto p-6 sm:p-10">
            <div
                class="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-end"
            >
                <!-- Button Group (aligned in a row on large screens) -->
                <div class="flex gap-3">
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
                        <mat-icon class="icon-size-7">refresh</mat-icon>
                    </button>

                    <!-- Cloumn filter-->
                    <button mat-icon-button (click)="cloumnshow()">
                        <mat-icon>filter_alt</mat-icon>
                    </button>

                    <!-- Filter Button -->
                    <!-- <button mat-icon-button (click)="toggleFilterPanel()">
                        <mat-icon>filter_list</mat-icon>
                    </button> -->

                    <!-- Add Doctor Button -->
                    <button mat-icon-button (click)="addpatientdialog()">
                        <mat-icon class="icon-size-7">control_point</mat-icon>
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
                                                    color="primary"
                                                    (click)="saveRow(element)"
                                                >
                                                    <mat-icon>save</mat-icon>
                                                </button>
                                                <button
                                                    mat-icon-button
                                                    color="warn"
                                                    (click)="cancelEdit()"
                                                >
                                                    <mat-icon>close</mat-icon>
                                                </button>
                                            </ng-container>
                                            <ng-template #actionButtons>
                                                <!-- Login -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="Login"
                                                >
                                                    <img
                                                        class="h-6 w-6"
                                                        src="images/logo/login.svg"
                                                    />
                                                </button>

                                                <!-- Edit -->
                                                <button
                                                    mat-icon-button
                                                    color="primary"
                                                    matTooltip="Edit"
                                                    (click)="
                                                        editRow(
                                                            element.user_row_id
                                                        )
                                                    "
                                                >
                                                    <mat-icon>edit</mat-icon>
                                                </button>

                                                <!-- Delete -->
                                                <button
                                                    mat-icon-button
                                                    color="warn"
                                                    matTooltip="Delete"
                                                    (click)="deletebtn(element)"
                                                >
                                                    <mat-icon>delete</mat-icon>
                                                </button>

                                                <!-- View -->
                                                <button
                                                    mat-icon-button
                                                    color="primary"
                                                    matTooltip="View Details"
                                                    (click)="
                                                        viewpatientDetails(
                                                            element.user_row_id
                                                        )
                                                    "
                                                >
                                                    <mat-icon
                                                        >visibility</mat-icon
                                                    >
                                                </button>

                                                <!-- Suspend -->
                                                <button
                                                    mat-icon-button
                                                    color="warn"
                                                    matTooltip="Suspend Patient"
                                                    (click)="
                                                        suspendPatient(element)
                                                    "
                                                >
                                                    <mat-icon
                                                        >pause_presentation</mat-icon
                                                    >
                                                </button>

                                                <!-- Lock -->
                                                <button
                                                    mat-icon-button
                                                    matTooltip="Lock Account"
                                                >
                                                    <mat-icon>lock</mat-icon>
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
import { DeldialogComponent } from '../../dialog/deldialog/deldialog.component';
import { AddpatientdialogComponent } from '../../dialog/doctor/addpatientdialog/addpatientdialog.component';
import { CloumnShowdialogComponent } from '../../dialog/doctor/cloumn-showdialog/cloumn-showdialog.component';
import { SuspendPatientComponent } from '../../dialog/suspend-patient/suspend-patient.component';
import { MatTooltipModule } from '@angular/material/tooltip';

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
        MatSortModule,MatTooltipModule
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

    deletebtn(patient: Patient) {
        this._matDialog.open(DeldialogComponent, {
            data: { patient: patient },
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
          console.log("res",result)
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




async function changePassword(req, res) {
  try {
    const { row_id, currentPassword, newPassword } = req.body;

    if (!row_id || !currentPassword || !newPassword) {
      return res.send(
        encodeRespData({
          msg: "All fields are required",
          status: 1,
        })
      );
    }

    // Step 1: Fetch user with matching current password
    const columns = ["row_id", "user_password"];
    const clause = `row_id = '${row_id}' AND user_password = '${currentPassword}' AND deleted = 0 AND active = 0`;
    const userResp = await queries.selectQuery(usersTable, columns, clause);

    if (!userResp || userResp.length === 0) {
      return res.send(
        encodeRespData({
          msg: "Current password is incorrect",
          status: 1,
        })
      );
    }

    // Step 2: Update to new password
    const updateData = { user_password: newPassword };
    const updateClause = `row_id = '${row_id}'`;
    const updateResp = await queries.updateQuery(usersTable, updateData, updateClause);

    if (updateResp.rowCount > 0 || updateResp.affectedRows > 0) {
      return res.send(
        encodeRespData({
          msg: "Password changed successfully",
          status: 0,
        })
      );
    } else {
      return res.send(
        encodeRespData({
          msg: "Failed to update password",
          status: 2,
        })
      );
    }
  } catch (error) {
    console.error("Change password error:", error);
    return res.send(
      encodeRespData({
        msg: "Something went wrong",
        status: 2,
      })
    );
  }
}


















