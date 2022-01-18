select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 156 and ss.ss_hash <= 489 and hd.hd_hash >= 29 and hd.hd_hash <= 779 and d.d_hash >= 597 and d.d_hash <= 997
;
