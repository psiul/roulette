select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 574 and ss.ss_hash <= 974 and hd.hd_hash >= 303 and hd.hd_hash <= 636 and i.i_hash >= 89 and i.i_hash <= 839
;
