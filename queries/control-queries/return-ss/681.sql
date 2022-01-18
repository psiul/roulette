select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 522 and ss.ss_hash <= 855 and hd.hd_hash >= 200 and hd.hd_hash <= 600 and i.i_hash >= 208 and i.i_hash <= 958
;
