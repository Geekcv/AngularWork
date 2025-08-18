<div class="flex min-w-0 flex-auto flex-col">
  <div class="flex-auto p-6 sm:p-10">

    <button class="fuse-mat-button-large mb-4" mat-flat-button (click)="goback()">
      <mat-icon [svgIcon]="'heroicons_outline:arrow-long-left'"></mat-icon>
    </button>

    <hr>

    @for (q of examData; track q.row_id) {
      <div class="question-card p-4 mb-4 border rounded-lg shadow-sm">
        <h3 class="font-bold text-lg">Q{{ $index + 1 }}. {{ q.question }}</h3>

        <!-- MCQ -->
        @if (['mcq','image_mcq','video_mcq','audio_mcq'].includes(q.question_type)) {
          @for (opt of q.options; track opt.label) {
            <div>
              <label [class.text-green-600]="q.correct_answer === opt.label">
                <input
                  type="radio"
                  name="q-{{ q.row_id }}"  
                  [value]="opt.label"
                  [(ngModel)]="studentAnswers[q.row_id]"
                  disabled
                /> 
                {{ opt.label }}. {{ opt.text }}
              </label>
            </div>
          }
          <!-- Show correct answer -->
          <p class="mt-1 text-sm text-green-700">
            ✅ Correct Answer: {{ q.correct_answer }}
          </p>
        }

        <!-- Checkbox -->
        @if (q.question_type === 'checkbox') {
          @for (opt of q.options; track opt.label) {
            <div>
              <label [class.text-green-600]="q.correct_answer?.includes(opt.label)">
                <input
                  type="checkbox"
                  [value]="opt.label"
                  [checked]="studentAnswers[q.row_id]?.includes(opt.label)"
                  disabled
                />
                {{ opt.label }}. {{ opt.text }}
              </label>
            </div>
          }
          <p class="mt-1 text-sm text-green-700">
            ✅ Correct Answer(s): {{ q.correct_answer?.join(', ') }}
          </p>
        }

        <!-- True / False -->
        @if (q.question_type === 'tf') {
          <div>
            <label [class.text-green-600]="q.correct_answer === 'true'">
              <input type="radio" disabled /> True
            </label>
          </div>
          <div>
            <label [class.text-green-600]="q.correct_answer === 'false'">
              <input type="radio" disabled /> False
            </label>
          </div>
          <p class="mt-1 text-sm text-green-700">
            ✅ Correct Answer: {{ q.correct_answer }}
          </p>
        }

        <!-- Fill in the blank / Short / Long / Numeric -->
        @if (['fill','short','long','numeric'].includes(q.question_type)) {
          <input type="text" [(ngModel)]="studentAnswers[q.row_id]" placeholder="Your answer" disabled />
          <p class="mt-1 text-sm text-green-700">
            ✅ Correct Answer: {{ q.correct_answer }}
          </p>
        }

        <!-- Match the Following -->
        @if (q.question_type === 'match') {
          @for (pair of q.pairs; track $index) {
            <div>
              {{ pair.left }} → 
              <input type="text" [(ngModel)]="studentAnswers[q.row_id][$index]" disabled />
            </div>
          }
          <p class="mt-1 text-sm text-green-700">
            ✅ Correct Matches: {{ q.correct_answer | json }}
          </p>
        }

        <!-- Arrange in Order -->
        @if (q.question_type === 'arrange') {
          @for (stmt of q.statements; track $index) {
            <input type="text" [(ngModel)]="studentAnswers[q.row_id][$index]" disabled />
          }
          <p class="mt-1 text-sm text-green-700">
            ✅ Correct Order: {{ q.correct_answer?.join(' → ') }}
          </p>
        }

        <!-- Coding -->
        @if (q.question_type === 'coding') {
          <textarea [(ngModel)]="studentAnswers[q.row_id]" disabled></textarea>
          <p class="mt-1 text-sm text-green-700">
            ✅ Expected Solution: {{ q.correct_answer }}
          </p>
        }

      </div>
    }

    <hr>
  </div>
</div>
