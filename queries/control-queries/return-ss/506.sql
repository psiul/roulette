select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 29 and d.d_hash <= 429 and i.i_hash >= 213 and i.i_hash <= 963 and hd.hd_hash >= 278 and hd.hd_hash <= 611
;
