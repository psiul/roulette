select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 219 and i.i_hash <= 619 and d.d_hash >= 90 and d.d_hash <= 423 and hd.hd_hash >= 198 and hd.hd_hash <= 948
;
