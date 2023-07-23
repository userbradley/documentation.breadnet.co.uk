---
title: Airflow basics
reviewdate: '2022-01-01'
---
# Airflow basics

<!--suppress ALL -->













<p id="bkmrk-airflow-exists-for-t">Airflow exists for the sole purpose of removing the need to write a bash or python script, set up a server with a cron job and then run your ETL pipeline. With Airflow we're doing all this under one roof with monitoring and visualization built in.</p>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-airflow-uses-somethi">Airflow uses something called a DAG (Directed acyclic graph) </p>
<p id="bkmrk-airflow-is-primerill">Airflow is primarily written with Python scrips that compose of the below imports </p>
<pre id="bkmrk-from-airflow-import-"><code class="language-Python">from airflow import DAG
from datetime import datetime</code></pre>
<p id="bkmrk-we-need-to-use-datet">We need to use datetime as airflow runs certain operations on a time schedule, an example is below</p>
<pre id="bkmrk-with-dag%28%22my_dag%22%2C-s"><code class="language-Python">with DAG("my_dag", start_date=datetime(2022, 1, 1), schedule_interval="@daily") as dag:</code></pre>
<p id="bkmrk-what-happens-here-is">What happens here is we:</p>
<ul id="bkmrk-define-the-dag-with-">
<li>Define the dag with a name
<ul>
<li><code>my_dag</code></li>
</ul>
</li>
<li>Set a start time that the Dag is effective from
<ul>
<li>2022, january the first</li>
</ul>
</li>
<li>Set a schuedle time
<ul>
<li>Daily at midnight (see below table)</li>
<li>Can also be a cron job</li>
</ul>
</li>
</ul>
<p id="bkmrk-we-have-a-set-few-op">We have a set few options of built in timings we can use, or a cron job.</p>
<h3 id="bkmrk-presets">Presets</h3>
<table id="bkmrk-preset-meaning-cron-" style="border-collapse: collapse; width: 100%; height: 232px;" border="1">
<tbody>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;">Preset</td>
<td style="width: 33.3333%; height: 29px;">Meaning</td>
<td style="width: 33.3333%; height: 29px;">Cron</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>None</code></td>
<td style="width: 33.3333%; height: 29px;">Don’t schedule, use for exclusively “externally triggered” DAGs</td>
<td style="width: 33.3333%; height: 29px;">N/a</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>@once</code></td>
<td style="width: 33.3333%; height: 29px;">Schedule once and only once</td>
<td style="width: 33.3333%; height: 29px;">N/a</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>@hourly</code></td>
<td style="width: 33.3333%; height: 29px;">Run once an hour at the beginning of the hour</td>
<td style="width: 33.3333%;"><code class="docutils literal notranslate"><span class="pre">0</span> <span class="pre">*</span> <span class="pre">*</span> <span class="pre">*</span> <span class="pre">*</span></code></td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>@daily</code></td>
<td style="width: 33.3333%;">Run once a day at midnight</td>
<td style="width: 33.3333%;"><code class="docutils literal notranslate"><span class="pre">0</span> <span class="pre">0</span> <span class="pre">*</span> <span class="pre">*</span> <span class="pre">*</span></code></td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>@weekly</code></td>
<td style="width: 33.3333%;">Run once a week at midnight on Sunday morning</td>
<td style="width: 33.3333%;"><code class="docutils literal notranslate"><span class="pre">0</span> <span class="pre">0</span> <span class="pre">*</span> <span class="pre">*</span> <span class="pre">0</span></code></td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>@monthly</code></td>
<td style="width: 33.3333%;">Run once a month at midnight of the first day of the month</td>
<td style="width: 33.3333%;"><code class="docutils literal notranslate"><span class="pre">0</span> <span class="pre">0</span> <span class="pre">1</span> <span class="pre">*</span> <span class="pre">*</span></code></td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;"><code>@yearly</code></td>
<td style="width: 33.3333%;">Run once a year at midnight of January 1</td>
<td style="width: 33.3333%; height: 29px;">
<div>
<table class="docutils" border="1">
<tbody valign="top">
<tr class="row-even">
<td><code class="docutils literal notranslate"><span class="pre">0</span> <span class="pre">0</span> <span class="pre">1</span> <span class="pre">1</span> <span class="pre">*</span></code></td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
<p id="bkmrk-note%3A-use-schedule_i">Note: use <code>schedule_interval=None</code> opposed to directly quoting with <code>"none"</code></p>
<p id="bkmrk-another-way-to-set-o">Another way to set out the config is like below:</p>
<pre id="bkmrk-default_args-%3D-%7B-%27ow"><code class="language-Python">default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2015, 12, 1),
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'schedule_interval': '@hourly',
}

dag = DAG('tutorial', catchup=False, default_args=default_args)</code></pre>
<p id="bkmrk-each-section-is-self">Each section is self explanatory (provided you can understand the general key value pari's name)<br>Some are not, I will explain below</p>
<ul id="bkmrk-depends_on_past-depe">
<li>depends_on_past
<ul>
<li>
<code>depends_on_past</code> (boolean) when set to True, keeps a task from getting triggered if the previous schedule for the task hasn’t succeeded.</li>
</ul>
</li>
<li>retry_delay
<ul>
<li>The delay after a failure before it should try the DAG again</li>
</ul>
</li>
<li>owner
<ul>
<li>Who owns the file permissions and who the program runs under</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-0"> </p>
<p id="bkmrk-the-catchup-is-quite">The catchup is quite advanced so we will deep dive it below</p>
<h3 id="bkmrk-catchup">Catchup</h3>
<p id="bkmrk-we-need-to-make-some">We need to make some assumptions here</p>
<p id="bkmrk-%C2%A0-1"> </p>
<ul id="bkmrk-assume-start-date-of">
<li>Assume
<ul>
<li>Start date of 2020-1-1</li>
<li>Start time of 6am</li>
<li>Schedule interval of hourly</li>
</ul>
</li>
</ul>
<p id="bkmrk-the-action-will-happ">The action will happen at 2020-1-1 7am</p>
<p id="bkmrk-use-the-equation-bel">Use the equation below</p>
<pre id="bkmrk-trigger-point-%E2%86%92-star"><code class="language-Python">Trigger Point → start_date + { schedule_interval } → till the end.</code></pre>
<p id="bkmrk-"><a href="https://doesnotexist/images/gallery/2022-01/iTU5rn2xNXtTTsvD-image-1643208864559.png" target="_blank" rel="noopener"><img src="https://doesnotexist/images/gallery/2022-01/scaled-1680-/iTU5rn2xNXtTTsvD-image-1643208864559.png" alt="image-1643208864559.png"></a></p>
<h4 id="bkmrk-%C2%A0-2">In simple terms</h4>
<p id="bkmrk-if-you-set-the-creat">If you set the create date a year ago, and upload it will create many many dag instances, to prevent this we set <code>catchup=False</code> </p>
<p id="bkmrk-the-below-explains-t">The below explains this in way too much detail, but it's good to have</p>
<p id="bkmrk--0"><a href="https://doesnotexist/images/gallery/2022-01/PULQzUkrTZW7aniq-image-1643209098829.png" target="_blank" rel="noopener"><img src="https://doesnotexist/images/gallery/2022-01/scaled-1680-/PULQzUkrTZW7aniq-image-1643209098829.png" alt="image-1643209098829.png"></a></p>
<p id="bkmrk-in-the-above-image-w" class="hk hl dp hm b hn ho hp hq hr hs ht hu hv hw hx hy hz ia ib ic id ie if ig ih dh em" data-selectable-paragraph="">In the above image we are initial config where everything is fine and our DAG Run happened at 6. Then we paused the DAG.</p>
<p id="bkmrk--1"><a href="" target="_blank" rel="noopener"><img src="https://doesnotexist/images/gallery/2022-01/scaled-1680-/dLOpUfxrWflaGAWU-image-1643209110255.png" alt="image-1643209110255.png"></a></p>
<p id="bkmrk-here-we-see-that-sin" class="hk hl dp hm b hn ho hp hq hr hs ht hu hv hw hx hy hz ia ib ic id ie if ig ih dh em" data-selectable-paragraph="">Here we see that since at the next schedule DAG run was paused hence start_date for the schedule is not available.</p>
<p id="bkmrk--2"><a href="https://doesnotexist/images/gallery/2022-01/wBAPtN6LZ09KCAt7-image-1643209119641.png" target="_blank" rel="noopener"><img src="https://doesnotexist/images/gallery/2022-01/scaled-1680-/wBAPtN6LZ09KCAt7-image-1643209119641.png" alt="image-1643209119641.png"></a></p>
<p id="bkmrk-at-the-next-schedule" class="hk hl dp hm b hn ho hp hq hr hs ht hu hv hw hx hy hz ia ib ic id ie if ig ih dh em" data-selectable-paragraph="">At the next schedule the same happened (DAG run was not triggered). Now we enable or schedule the DAG run from console</p>
<p id="bkmrk--3"><a href="https://doesnotexist/images/gallery/2022-01/pMwlmxAqTVobvGaB-image-1643209131654.png" target="_blank" rel="noopener"><img src="https://doesnotexist/images/gallery/2022-01/scaled-1680-/pMwlmxAqTVobvGaB-image-1643209131654.png" alt="image-1643209131654.png"></a></p>
<p id="bkmrk-in-the-above-diagram" class="hk hl dp hm b hn ho hp hq hr hs ht hu hv hw hx hy hz ia ib ic id ie if ig ih dh em" data-selectable-paragraph="">In the above diagram we see at the next schedule previously missed DAG Runs were triggered. Notice start_date is the next schedule (9). While the Execution dates are the actual ones, if you notice, start_date are same for the last three DAG runs. This denotes backfill. So first DAG run for execution date of 6 happened then for 7 and then for 8.</p>
<p id="bkmrk-%C2%A0-4" class="hk hl dp hm b hn ho hp hq hr hs ht hu hv hw hx hy hz ia ib ic id ie if ig ih dh em" data-selectable-paragraph=""> </p>
<p id="bkmrk-%C2%A0-5" class="hk hl dp hm b hn ho hp hq hr hs ht hu hv hw hx hy hz ia ib ic id ie if ig ih dh em" data-selectable-paragraph=""> </p>
<p id="bkmrk-%C2%A0-6"> </p>