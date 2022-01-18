select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 529 and ss.ss_hash <= 929 and i.i_hash >= 138 and i.i_hash <= 888 and cd.cd_hash >= 440 and cd.cd_hash <= 773
;
