select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 221 and i.i_hash <= 554 and d.d_hash >= 6 and d.d_hash <= 406 and hd.hd_hash >= 94 and hd.hd_hash <= 844
;
