select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 336 and ss.ss_hash <= 836 and i.i_hash >= 723 and i.i_hash <= 923
;
