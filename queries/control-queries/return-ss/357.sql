select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 142 and ss.ss_hash <= 475 and hd.hd_hash >= 105 and hd.hd_hash <= 855 and i.i_hash >= 552 and i.i_hash <= 952
;
