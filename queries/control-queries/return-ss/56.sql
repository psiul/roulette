select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and d.d_hash >= 312 and d.d_hash <= 712 and hd.hd_hash >= 188 and hd.hd_hash <= 938 and i.i_hash >= 22 and i.i_hash <= 355
;
