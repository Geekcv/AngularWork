<div class="flex min-w-0 flex-auto flex-col">
  <div class="flex-auto p-6 sm:p-10">

    <button class="fuse-mat-button-large mb-4" mat-flat-button (click)="goback()">
      <mat-icon [svgIcon]="'heroicons_outline:arrow-long-left'"></mat-icon>
    </button>

    <hr />

    @for (q of examData; track q.row_id) {
    <div class="question-card p-4 mb-4 border rounded-lg shadow-sm">
      
      <!-- Edit Mode Toggle -->
      <div class="flex justify-between items-center">
        <h3 class="font-bold text-lg">
          Q{{ $index + 1 }}.
          @if (!q.isEdit) { {{ q.question }} }
          @else {
            <input type="text" [(ngModel)]="q.question" class="border rounded p-1 w-full" />
          }
        </h3>
        <button mat-stroked-button color="primary" (click)="q.isEdit = !q.isEdit">
          {{ q.isEdit ? 'Save' : 'Edit' }}
        </button>
      </div>

      <div class="mt-3">
        <!-- MCQ -->
        @if (['mcq','image_mcq','video_mcq','audio_mcq'].includes(q.question_type)) {
          @for (opt of q.options; track opt.label) {
            <div class="mb-2 flex gap-2 items-center">
              <span class="font-medium">{{ opt.label }}.</span>
              @if (!q.isEdit) {
                {{ opt.text }}
              }
              @else {
                <input type="text" [(ngModel)]="opt.text" class="border rounded p-1 flex-1" />
              }
            </div>
          }
          <p class="mt-2 text-sm text-green-700">
            Correct Answer:
            @if (!q.isEdit) { {{ q.correct_answer.answers }} }
            @else {
              <input type="text" [(ngModel)]="q.correct_answer.answers" class="border rounded p-1" />
            }
          </p>
        }

        <!-- Checkbox -->
        @if (q.question_type === 'checkbox') {
          @for (opt of q.options; track opt.label) {
            <div class="mb-2">
              <span>{{ opt.label }}.</span>
              @if (!q.isEdit) { {{ opt.text }} }
              @else {
                <input type="text" [(ngModel)]="opt.text" class="border rounded p-1" />
              }
            </div>
          }
          <p class="mt-2 text-sm text-green-700">
            Correct Answer(s):
            @if (!q.isEdit) { {{ q.correct_answer.answers?.join(', ') }} }
            @else {
              <input type="text" [(ngModel)]="q.correct_answer.answers" placeholder="A,B,C" class="border rounded p-1" />
            }
          </p>
        }

        <!-- True / False -->
        @if (q.question_type === 'tf') {
          <p class="mt-2 text-sm text-green-700">
            Correct Answer:
            @if (!q.isEdit) { {{ q.correct_answer.answers }} }
            @else {
              <select [(ngModel)]="q.correct_answer.answers" class="border rounded p-1">
                <option value="true">True</option>
                <option value="false">False</option>
              </select>
            }
          </p>
        }

        <!-- Fill/Short/Long -->
        @if (['fill','short','long'].includes(q.question_type)) {
          <p class="mt-2 text-sm text-green-700">
            Correct Answer:
            @if (!q.isEdit) { {{ q.correct_answer.answers }} }
            @else {
              <textarea [(ngModel)]="q.correct_answer.answers" class="border rounded p-2 w-full"></textarea>
            }
          </p>
        }

        <!-- Match the Following -->
        @if (q.question_type === 'match') {
          <div class="mt-3">
            <p class="font-semibold">Options:</p>
            @for (pair of q.options; track $index) {
              <div class="flex gap-2">
                @if (!q.isEdit) {
                  {{ pair.left }} -> {{ pair.right }}
                }
                @else {
                  <input type="text" [(ngModel)]="pair.left" placeholder="Left" class="border p-1 rounded" />
                  <input type="text" [(ngModel)]="pair.right" placeholder="Right" class="border p-1 rounded" />
                }
              </div>
            }
          </div>
          <div class="mt-2 text-green-700">
            <p class="font-semibold">Correct Matches:</p>
            @for (pair of q.correct_answer.answers; track $index) {
              <div>
                @if (!q.isEdit) {
                  {{ pair.left }} -> {{ pair.right }}
                }
                @else {
                  <input type="text" [(ngModel)]="pair.left" placeholder="Left" class="border p-1 rounded" />
                  <input type="text" [(ngModel)]="pair.right" placeholder="Right" class="border p-1 rounded" />
                }
              </div>
            }
          </div>
        }

        <!-- Arrange in Order -->
        @if (q.question_type === 'arrange') {
          <div class="mt-3">
            <p class="font-semibold">Options:</p>
            @for (opt of q.options; track $index) {
              <div class="flex gap-2">
                <span>{{ opt.label }}.</span>
                @if (!q.isEdit) { {{ opt.text }} }
                @else {
                  <input type="text" [(ngModel)]="opt.text" class="border rounded p-1" />
                }
              </div>
            }
          </div>
          <p class="mt-2 text-sm text-green-700">
            Correct Order:
            @if (!q.isEdit) { {{ q.correct_answer.answers?.join(' -> ') }} }
            @else {
              <input type="text" [(ngModel)]="q.correct_answer.answers" placeholder="A,B,C,D" class="border rounded p-1 w-full" />
            }
          </p>
        }

      </div>
    </div>
    }

    <hr />
    <button mat-flat-button color="primary" class="px-8 py-2 rounded-lg shadow-md" >
      Save All Changes
    </button>

  </div>
</div>
