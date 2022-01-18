select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 652 and ss.ss_hash <= 985 and i.i_hash >= 203 and i.i_hash <= 603 and hd.hd_hash >= 70 and hd.hd_hash <= 820
;
