select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 198 and ss.ss_hash <= 598 and hd.hd_hash >= 646 and hd.hd_hash <= 979 and i.i_hash >= 238 and i.i_hash <= 988
;
