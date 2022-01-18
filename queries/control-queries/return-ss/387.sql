select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 144 and ss.ss_hash <= 894 and i.i_hash >= 147 and i.i_hash <= 547 and d.d_hash >= 223 and d.d_hash <= 556
;
