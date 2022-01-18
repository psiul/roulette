select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 8 and ss.ss_hash <= 758 and hd.hd_hash >= 72 and hd.hd_hash <= 472 and d.d_hash >= 625 and d.d_hash <= 958
;
