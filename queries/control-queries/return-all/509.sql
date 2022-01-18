select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 586 and d.d_hash <= 919 and i.i_hash >= 7 and i.i_hash <= 407 and hd.hd_hash >= 162 and hd.hd_hash <= 912
;
