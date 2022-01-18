select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 523 and ss.ss_hash <= 923 and d.d_hash >= 192 and d.d_hash <= 942 and hd.hd_hash >= 594 and hd.hd_hash <= 927
;
