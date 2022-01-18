select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and d.d_hash >= 49 and d.d_hash <= 382 and hd.hd_hash >= 63 and hd.hd_hash <= 813 and i.i_hash >= 10 and i.i_hash <= 410
;
