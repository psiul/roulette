select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 81 and ss.ss_hash <= 831 and i.i_hash >= 405 and i.i_hash <= 738 and cd.cd_hash >= 596 and cd.cd_hash <= 996
;
