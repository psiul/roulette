select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 421 and ss.ss_hash <= 754 and i.i_hash >= 164 and i.i_hash <= 914 and hd.hd_hash >= 294 and hd.hd_hash <= 694
;
