select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and hd.hd_hash >= 157 and hd.hd_hash <= 557 and d.d_hash >= 147 and d.d_hash <= 897 and i.i_hash >= 435 and i.i_hash <= 768
;
