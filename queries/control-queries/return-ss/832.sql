select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,household_demographics hd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 49 and ss.ss_hash <= 799 and d.d_hash >= 504 and d.d_hash <= 837 and i.i_hash >= 124 and i.i_hash <= 524
;
